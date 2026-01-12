package com.nttdata.api;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import java.util.ArrayList;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import java.io.File;
import java.util.Collection;
import org.apache.commons.io.FileUtils;

import static org.junit.jupiter.api.Assertions.*;

class PetStoreRunner {

    @Test
    void testParallel() {
        // Ejecuto todos los features en paralelo
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .parallel(4);
        generateReport(results.getReportDir());

        // Falla el test de JUnit si hubo errores en Karate
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    // Método para construir el reporte HTML (Basado en tu PDF)
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        Configuration config = new Configuration(new File("build/reports/cucumber"), "PetStore API");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}

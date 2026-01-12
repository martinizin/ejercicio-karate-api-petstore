function fn() {
    var env = karate.env; // lee la propiedad del sistema -Dkarate.env
    karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'dev';
    }

    var config = {
        baseUrl: 'https://petstore.swagger.io/v2',
        connTimeout: 5000,
        readTimeout: 5000
    }

    if (env == 'dev') {
        // config.someVariable = 'someValue';
    }

    return config;
}
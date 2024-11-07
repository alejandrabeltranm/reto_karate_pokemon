function fn() {
  var env = karate.env; // obtener la propiedad 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'https://pokeapi.co/api/v2' // URL base de la API
  };

  // Activar confianza SSL para todos los certificados
  karate.configure('ssl', true);

  if (env == 'dev') {
    // personalizar para dev
  } else if (env == 'e2e') {
    // personalizar para e2e
  }

  return config;
}
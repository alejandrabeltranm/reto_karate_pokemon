function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'https://pokeapi.co/api/v2'
  };

  karate.configure('ssl', true);

  if (env == 'dev') {
  } else if (env == 'e2e') {
  }

  return config;
}
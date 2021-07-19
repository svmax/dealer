export const apiNamespace = 'api/v1';
export const apiPort = 3000;
export const apiHost = '127.0.0.1';
export const apiUrlScheme = 'http';
export const apiBaseUrl = `${apiUrlScheme}://${apiHost}:${apiPort}`;

export const googleMapsApiKey = process.env.VUE_APP_GOOGLE_MAPS_API_KEY;
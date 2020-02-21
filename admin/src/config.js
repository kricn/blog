let server = '';

if(process.env.NODE_ENV=="development"){
  server = "http://localhost:3000/"
}else{
  server = "http://134.175.241.15:3000/"
}

export const SERVER = server

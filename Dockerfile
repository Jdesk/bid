FROM node:5.0.0-onbuild 

ENV NODE_ENV=production \ 
daemon=false \ 
silent=false 
CMD node app --setup && npm start EXPOSE 4567


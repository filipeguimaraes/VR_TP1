FROM node:alpine

#Expor a porta onde vai estar instalado o servidor
EXPOSE 8080

#Atualizar o Alpine
RUN apk -U upgrade
RUN apk add vim

#Criar a pasta para os ficheiros do servidor
RUN mkdir -p /home/site

#Instalar as dependências do servidor
WORKDIR /home/site
COPY package*.json ./
RUN npm install

#Copiar os ficheiros para dentro do container
COPY . .

#Criar um volume para presistência
VOLUME /home/site

#Comando a executar quando o container for executado
CMD [ "npm","start" ]

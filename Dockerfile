# Use a imagem Node.js como base
FROM node:18

# Instalar dependências globais
RUN npm install -g @angular/cli@latest

# Instalar o Azion CLI (substitua pelo comando correto de instalação, se necessário)
RUN curl -O https://downloads.azion.com/linux/x86_64/azion && \
    chmod +x azion && \
    mv azion /usr/local/bin/

# Definir diretório de trabalho
WORKDIR /app

# Copiar todos os arquivos de configuração primeiro
COPY package*.json yarn.lock ./

# Instalar dependências usando yarn
RUN yarn install

# Copiar o restante dos arquivos do projeto
COPY . .

# Expor a porta necessária
EXPOSE 4200

# Comando para iniciar a aplicação
CMD ["ng", "serve", "--host", "0.0.0.0"]

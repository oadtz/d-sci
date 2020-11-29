FROM nginx

# Set working directory
WORKDIR /usr/app

# Install PM2 globally
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs htop python-certbot-nginx cron
RUN npm install --global pm2

# Copy "package.json" and "package-lock.json" before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY ./package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY ./ ./

# Build app
RUN npm run build

# Setup services
RUN rm /etc/nginx/conf.d/default.conf
ADD ./www.conf /etc/nginx/conf.d/www.conf
ADD ./ssl.conf /etc/nginx/conf.d/ssl.conf.bak

EXPOSE 80
EXPOSE 443

RUN chmod +x ./start.sh
RUN chmod +x ./convert-cert.sh
# Launch app with 
CMD ["./start.sh"]

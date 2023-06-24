version: '3.9'
services:
  #Nginx Service
  webserver:
    restart: unless-stopped
    build:
      context: ./config/nginx/
      dockerfile: Dockerfile
    depends_on:
      - app-trad
      - app-cm
      - app-emergencias
      - app-admin
    volumes:
      - ../traducciones_app/:/var/www/${APP_DOMAIN}/
      - ../cm_psiconnea/:/var/www/${CM_DOMAIN}/
      - ../emergencias/:/var/www/${EMERGENCIA_DOMAIN}/
      - ../psiconnea-admin/:/var/www/${ADMIN_DOMAIN}/
      - ./config/nginx/nginx.conf:/etc/nginx/nginx.conf
      - ./config/nginx/sites-available:/etc/nginx/sites-available/
      - ./config/nginx/sites-available:/etc/nginx/sites-enabled/
      - ./docker/nginx/ssh/letsencrypt/:/etc/letsencrypt/

    command: [ nginx-debug, '-g', 'daemon off;' ]
    container_name: webserver
    ports:
      - "80:80"
      - "443:443"
    networks:
      vpcGlobal:
        ipv4_address: 16.5.0.2
  #PHP Service
  app-trad:
    build:
      context: ./config/php/7_4/
      dockerfile: Dockerfile
    container_name: app-trad
    restart: unless-stopped
    tty: true
    working_dir: /var/www/${APP_DOMAIN}/
    volumes:
      - ../traducciones_app/:/var/www/${APP_DOMAIN}/
      - ./docker/php/php.ini:/usr/local/etc/php/conf.d/php.ini
    networks:
      vpcGlobal:
        ipv4_address: 16.5.0.3
  #PHP CM
  app-cm:
    build:
      context: ./config/php/8_1/
      dockerfile: Dockerfile
    container_name: app-cm
    restart: unless-stopped
    tty: true
    working_dir: /var/www/${CM_DOMAIN}/
    volumes:
      - ../cm_psiconnea/:/var/www/${CM_DOMAIN}/
      - ./docker/php/php.ini:/usr/local/etc/php/conf.d/php.ini
    networks:
      vpcGlobal:
        ipv4_address: 16.5.0.4
  #PHP EMERGENCIAS
  app-emergencias:
    build:
      context: ./config/php/8_1/
      dockerfile: Dockerfile
    container_name: app-emergencias
    restart: unless-stopped
    tty: true
    environment:
      SERVICE_NAME: app
      SERVICE_TAGS: dev
    working_dir: /var/www/${EMERGENCIA_DOMAIN}/
    volumes:
      - ../emergencias/:/var/www/${EMERGENCIA_DOMAIN}/
      - ./docker/php/php.ini:/usr/local/etc/php/conf.d/php.ini
    networks:
      vpcGlobal:
        ipv4_address: 16.5.0.6
  #PHP ADMIN
  app-admin:
    build:
      context: ./config/php/8_1/
      dockerfile: Dockerfile
    container_name: app-admin
    restart: unless-stopped
    tty: true
    working_dir: /var/www/${ADMIN_DOMAIN}/
    volumes:
      - ../psiconnea-admin/:/var/www/${ADMIN_DOMAIN}/
      - ./docker/php/php.ini:/usr/local/etc/php/conf.d/php.ini
    networks:
      vpcGlobal:
        ipv4_address: 16.5.0.7
  front-solicitar:
    image: node:alpine
    container_name: front-solicitar
    restart: unless-stopped
    volumes:
      - ../psiconnea-front/:/app
    working_dir: /app
    tty: true
    ports:
      - "3000:3000"
    networks:
      vpcGlobal:
        ipv4_address: 16.5.0.14
#Docker Networks
networks:
  vpcGlobal:
    name: vpcGlobal
    external: true

# In all environments, the following files are loaded if they exist,
# the latter taking precedence over the former:
#
#  * .env                contains default values for the environment variables needed by the app
#  * .env.local          uncommitted file with local overrides
#  * .env.$APP_ENV       committed environment-specific defaults
#  * .env.$APP_ENV.local uncommitted environment-specific overrides
#
# Real environment variables win over .env files.
#
# DO NOT DEFINE PRODUCTION SECRETS IN THIS FILE NOR IN ANY OTHER COMMITTED FILES.
#
# Run "composer dump-env prod" to compile .env files for production use (requires symfony/flex >=1.2).
# https://symfony.com/doc/current/best_practices.html#use-environment-variables-for-infrastructure-configuration

###> symfony/framework-bundle ###
APP_ENV=dev
APP_SECRET=58453ab957da81c6070c17e084d7fb78
###< symfony/framework-bundle ###

###> lexik/jwt-authentication-bundle ###
JWT_SECRET_KEY=%kernel.project_dir%/config/jwt/private.pem
JWT_PUBLIC_KEY=%kernel.project_dir%/config/jwt/public.pem
JWT_PASSPHRASE=caa7a91748834b4bfbb3169c433c2e9b
###< lexik/jwt-authentication-bundle ###

###> doctrine/doctrine-bundle ###
# Format described at https://www.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url
# IMPORTANT: You MUST configure your server version, either here or in config/packages/doctrine.yaml
#
# DATABASE_URL="sqlite:///%kernel.project_dir%/var/data.db"
DATABASE_URL="mysql://web:5pTWYzG8qb48@15.236.68.223:3306/psiconnea?serverVersion=5.6.51"
#DATABASE_URL="postgresql://symfony:ChangeMe@127.0.0.1:5432/app?serverVersion=13&charset=utf8"
###< doctrine/doctrine-bundle ###

LARAVEL_KEY=4ybM4WfTsH+Gv0S8Auvn5ITf9iGgQmNCgo7LS5s9Tik=

ADMIN_APP_HOST=admin.psiconnea.com
ADMIN_APP_SCHEME=https

FRONT_APP_URL=https://app.psiconnea.com
SEND_ALL_EMAILS_TO=

###> symfony/messenger ###
# Choose one of the transports below
# MESSENGER_TRANSPORT_DSN=doctrine://default
# MESSENGER_TRANSPORT_DSN=amqp://guest:guest@localhost:5672/%2f/messages
# MESSENGER_TRANSPORT_DSN=redis://localhost:6379/messages
###< symfony/messenger ###



###> symfony/mailer ###
# MAILER_DSN=null://null
###< symfony/mailer ###

###> symfony/google-mailer ###
# Gmail SHOULD NOT be used on production, use it in development only.

###< symfony/google-mailer ###
MAILER_DSN=gmail://equipo@psiconnea.com:oijwchbrrnxbhkgt@default
###< symfony/google-mailer ###

###> symfony/swiftmailer-bundle ###
# For Gmail as a transport, use: "gmail://username:password@localhost"
# For a generic SMTP server, use: "smtp://localhost:25?encryption=&auth_mode="
# Delivery is disabled by default via "null://localhost"
#MAILER_URL=null://localhost
MAILER_URL=gmail://psicoemergencias@psiconnea.com:Onnea12347*@default
###< symfony/swiftmailer-bundle ###
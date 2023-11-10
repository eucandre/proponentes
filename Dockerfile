# Use a imagem oficial do Ruby
FROM ruby:3.2.2

# Atualize o sistema e instale as dependências
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configure o diretório de trabalho
WORKDIR /app

# Copie o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock /app/

# Instale as gems
RUN gem install bundler:2.3.5
RUN bundle install

# Copie o restante do aplicativo para o contêiner
COPY . /app/

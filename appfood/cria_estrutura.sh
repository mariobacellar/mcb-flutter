#!/bin/bash

# Define o nome da pasta principal onde a estrutura será criada
# Se você já estiver dentro do diretório do projeto, pode remover "lib/" das linhas abaixo.
BASE_DIR="lib"

# 1. Cria a pasta principal
echo "Criando pasta base: $BASE_DIR/"
mkdir -p $BASE_DIR

# 2. Cria o arquivo principal
echo "Criando arquivo principal: $BASE_DIR/main.dart"
touch $BASE_DIR/main.dart

# 3. Cria as subpastas
echo "Criando subpastas..."
mkdir -p $BASE_DIR/screens
mkdir -p $BASE_DIR/models
mkdir -p $BASE_DIR/services
mkdir -p $BASE_DIR/widgets

# 4. Cria os arquivos dentro da pasta 'screens'
echo "Criando arquivos em screens/..."
touch $BASE_DIR/screens/login_screen.dart
touch $BASE_DIR/screens/home_screen.dart
touch $BASE_DIR/screens/restaurant_screen.dart
touch $BASE_DIR/screens/cart_screen.dart

# 5. Cria os arquivos dentro da pasta 'models'
echo "Criando arquivos em models/..."
touch $BASE_DIR/models/restaurant.dart
touch $BASE_DIR/models/product.dart
touch $BASE_DIR/models/order.dart

# 6. Cria os arquivos dentro da pasta 'services'
echo "Criando arquivos em services/..."
touch $BASE_DIR/services/api_service.dart

# 7. Cria os arquivos dentro da pasta 'widgets'
echo "Criando arquivos em widgets/..."
touch $BASE_DIR/widgets/restaurant_card.dart
touch $BASE_DIR/widgets/product_tile.dart

echo ""
echo "Estrutura de pastas e arquivos criada com sucesso na pasta '$BASE_DIR/'!"

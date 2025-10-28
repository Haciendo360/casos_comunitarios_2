#!/bin/bash
set -e

echo "🔄 Aplicando migraciones de Django..."
python manage.py migrate --noinput

echo "📦 Recopilando archivos estáticos..."
python manage.py collectstatic --noinput

echo "🚀 Iniciando Gunicorn..."
exec gunicorn sistema_casos_comunitario.wsgi:application
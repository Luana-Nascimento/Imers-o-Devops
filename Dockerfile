# Use uma imagem Python oficial e estável. A tag 'slim' é uma boa escolha
# por ser menor que a padrão, mas com mais compatibilidade que a 'alpine'.
FROM python:3.12-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências primeiro.
# Isso aproveita o cache de layers do Docker: se o requirements.txt não mudar,
# o Docker não reinstalará as dependências a cada build.
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da sua aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que sua aplicação roda (ajuste se for diferente)
EXPOSE 8000

# Define o comando para iniciar sua aplicação.
# Lembre-se de substituir 'app.py' pelo nome do seu arquivo principal.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload" ]



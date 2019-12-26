FROM mcr.microsoft.com/azure-cli

COPY /src/ /

WORKDIR /

RUN AZURE_CLI_DISABLE_CONNECTION_VERIFICATION=1

RUN chmod +x init_script.sh
RUN chmod +x storage.json

# CMD ["/bin/bash"]

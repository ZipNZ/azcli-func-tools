FROM mcr.microsoft.com/dotnet/runtime:3.1

WORKDIR /install

COPY ./bootstrap-scripts .

RUN ./install-azcli.sh && \
      ./install-func-tools-core.sh

CMD [ "func" ]


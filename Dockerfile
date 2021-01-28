FROM mcr.microsoft.com/azure-cli

RUN apk update && \
      apk add \
      nodejs \
      npm \
      gcompat \
      libc6-compat

RUN npm i -g azure-functions-core-tools@3 --unsafe-perm true

CMD ["func"]

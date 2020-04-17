FROM buildpack-deps as protoc

WORKDIR /tmp
RUN curl -L -O https://github.com/protocolbuffers/protobuf/releases/download/v3.11.4/protoc-3.11.4-linux-x86_64.zip
RUN curl -L -O https://github.com/grpc/grpc-web/releases/download/1.0.7/protoc-gen-grpc-web-1.0.7-linux-x86_64
RUN unzip protoc-3.11.4-linux-x86_64.zip && cp ./bin/protoc /usr/local/bin/. && chmod +x /usr/local/bin/protoc
RUN cp protoc-gen-grpc-web-1.0.7-linux-x86_64 /usr/local/bin/protoc-gen-grpc-web && chmod +x /usr/local/bin/protoc-gen-grpc-web

WORKDIR /app

ENTRYPOINT [ "protoc" ]
CMD [ "--help" ]

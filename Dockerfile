FROM busybox

ARG VERSION=0.42.0

RUN mkdir /opt
WORKDIR /opt

COPY sha256sum.txt /opt/

RUN wget https://repository.sonatype.org/service/local/repositories/central-proxy/content/com/datadoghq/dd-java-agent/${VERSION}/dd-java-agent-${VERSION}.jar && \
    ln -s dd-java-agent-${VERSION}.jar dd-java-agent.jar && \
    sha256sum -c sha256sum.txt

CMD ["sleep", "infinity"]

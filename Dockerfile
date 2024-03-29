FROM ubuntu:18.04

RUN dpkg --add-architecture i386 && \
        apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
        apt-get install -y mc vim && \
        apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386 && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;
	
# Fix certificate issues, found as of 
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get update && \
	apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Setup JAVA_HOME, this is useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

WORKDIR /app
COPY . /app
RUN mkdir /dare_out
#CMD ["echo","Salam"]
ENTRYPOINT ["/app/run.sh"]
#CMD ["./run.sh"]

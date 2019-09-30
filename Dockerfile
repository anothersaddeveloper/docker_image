FROM openjdk:11-jre-slim-buster

RUN apt-get update && apt-get -y install gnupg2 && \
    wget https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && apt-get install -y \
        groff \
        jq \
        less \
        python3 \
        python3-pip \
        yarn && \
    pip3 install --upgrade pip awscli boto3 aws-sam-cli  && \
    apt-get remove --purge ${builds_deps} -y && \
    apt-get clean && \
    rm -rf -- /var/lib/apt/lists/*



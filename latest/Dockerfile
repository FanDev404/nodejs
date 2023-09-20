FROM        node:bullseye-slim

ARG        BUILDPLATFORM


RUN        apt-get update -y \
            && apt-get upgrade -y \
            && apt -y install ffmpeg iproute2 git chromium speedtest-cli imagemagick sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping wget \
            && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
            && sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google.list" \
            && apt-get update \
            && apt-get install -y --no-install-recommends google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf \
            && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
            && apt-get autoremove -y \
            && apt-get autoclean -y \
            && rm -rf /var/lib/apt/lists/* \
            && npm -g install npm@latest \
            && npm -g install pm2@latest \
            && useradd -m -d /home/container container


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]

FROM ubuntu:14.04.4
ENV TARGET_DIR=/data
ENV GIT_BRANCH=master

# Install  git

RUN apt-get update \
  && mkdir -p /usr/local/bin \
  && apt-get install -y curl git rsync \
  && curl https://raw.github.com/cyaninc/git-fat/master/git_fat/git_fat.py \
| tee /usr/local/bin/git-fat && chmod +x /usr/local/bin/git-fat \
  && rm -rf /var/lib/apt/lists/*

# Configure .ssh directory
RUN mkdir /root/.ssh \
  && chmod 0600 /root/.ssh \
  && echo StrictHostKeyChecking no > /root/.ssh/config

# Configure entrypoint
COPY /docker-entrypoint.sh /
COPY /docker-entrypoint.d/* /docker-entrypoint.d/
RUN chmod 755 /docker-entrypoint.sh && chmod -R 755 /docker-entrypoint.d

ENTRYPOINT ["/docker-entrypoint.sh"]

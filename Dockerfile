FROM alpine:3.10
RUN apk add --no-cache ruby

COPY . /opt/reggie
WORKDIR /opt/reggie
RUN echo "gem: --no-rdoc --no-ri" > /etc/gemrc \
 && gem install bundler \
 && bundle \
 && gem sources --clear-all

CMD ["/usr/bin/ruby", "reggie.rb"]

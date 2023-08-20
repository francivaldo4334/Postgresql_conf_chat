FROM postgres:14

RUN apt-get update && apt-get -y install git build-essential postgresql-server-dev-14

RUN git clone https://github.com/citusdata/pg_cron.git
RUN cd pg_cron && make && make install

COPY postgresql.conf /etc/postgresql/14/main/postgresql.conf

EXPOSE 5432

ENV POSTGRES_USER postgres

ENV POSTGRES_DB conf-chat

CMD ["postgres"]
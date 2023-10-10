FROM alpine/git:latest as ircie
WORKDIR /ircie
RUN git clone https://git.supernets.org/sad/ircie.git

FROM rust:1-bookworm as builder
WORKDIR /app
COPY . .
COPY --from=ircie /ircie/ /app/
RUN cargo build --release

FROM rust:1-bookworm as app
WORKDIR /hardfight
COPY --from=builder /app/target/release/hardfight .
CMD ["./hardfight"]
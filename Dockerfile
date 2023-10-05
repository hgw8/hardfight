FROM rust:bookworm
WORKDIR /app
RUN git clone https://git.supernets.org/sad/ircie.git
COPY . .
RUN cargo build --release
CMD ["./target/release/hardfight"]
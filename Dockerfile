FROM rust:bookworm
WORKDIR /app
RUN mkdir save
RUN git clone https://github.com/ayywrk/ircie
COPY . .
RUN cargo build --release
CMD ["./target/release/hardfight"]
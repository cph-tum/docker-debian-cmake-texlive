FROM debian:latest

RUN apt update -y && apt-get upgrade -y
RUN apt install -y cmake git poppler-utils imagemagick nsis tar wget python3

# Perl libraries for latexindent
RUN cpan Log::Log4perl Log::LogDispatch Log::Dispatch::File YAML::Tiny \
  File::HomeDir

# texlive
RUN cd /usr/local/src && \
  wget ftp://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2021/install-tl-unx.tar.gz && \
  tar -xz -f install-tl-unx.tar.gz && \
  cd install-tl-20* && \
  echo "selected_scheme scheme-full" > profile && \
  ./install-tl \
    -profile profile
ENV PATH /usr/local/texlive/2021/bin/x86_64-linux:$PATH

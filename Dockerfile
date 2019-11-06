FROM debian:latest

RUN apt update -y
RUN apt install -y cmake git poppler-utils imagemagick tar wget


# Perl libraries for latexindent
RUN cpan Log::Log4perl Log::LogDispatch Log::Dispatch::File YAML::Tiny \
  File::HomeDir

# texlive
RUN cd /usr/local/src && \
  wget ftp://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2017/tlnet-final/install-tl-unx.tar.gz && \
  tar -xz -f install-tl-unx.tar.gz && \
  cd install-tl-20* && \
  echo "selected_scheme scheme-full" > profile && \
  ./install-tl \
    -repository ftp://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2017/tlnet-final \
    -profile profile
ENV PATH /usr/local/texlive/2017/bin/x86_64-linux:$PATH

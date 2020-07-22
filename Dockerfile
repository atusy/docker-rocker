FROM atusy/atusyverse:dev

ARG GITHUB_PAT=""

RUN echo "GITHUB_PAT=${GITHUB_PAT}" >> /usr/local/lib/R/etc/Renviron \
 && echo "options(usethis.full_name = Atsushi Yasumoto)" >> /usr/local/lib/R/etc/Rprofile.site

USER rstudio

RUN  git config --global user.name atusy \
  && git config --global user.email 30277794+atusy@users.noreply.github.com

USER root


FROM atusy/atusyverse:dev

ARG GITHUB_PAT=""

RUN echo "GITHUB_PAT=${GITHUB_PAT}" >> /usr/local/lib/R/etc/Renviron

RUN tlmgr install lineno \
  && tlmgr path add \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin

RUN install2.r --error -n -1 --skipinstalled \
    EMCluster \
    # Not sure why required
    bindrcpp \
  && Rscript -e "options(Ncpus = max(1L, parallel::detectCores())); remotes::install_github(c('atusy/qntmap@dev', 'atusy/mytools@dev'), upgrade = 'always', dependencies = TRUE)" \
  && chown -R root:staff /usr/local/lib/R/site-library

USER rstudio

RUN  git config --global user.name atusy \
  && git config --global user.email 30277794+atusy@users.noreply.github.com

USER root


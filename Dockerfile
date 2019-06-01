FROM atusy/atusyverse:dev

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

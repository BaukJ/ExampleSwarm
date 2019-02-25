FROM gerritcodereview/gerrit:2.16.5

RUN git clone --bare https://github.com/BaukJ/spring-petclinic.git /var/gerrit/git/spring-petclinic \
 && git clone --no-checkout /var/gerrit/git/spring-petclinic /tmp/spring-petclinic \
 && cd /tmp/spring-petclinic \
 && git config --local user.name BAUK-SETUP \
 && git config --local user.email BAUK-SETUP@example.com \
 && git checkout --orphan config \
 && git reset --hard && git clean -fdx \
 && git commit --allow-empty -m "Adding config files" \
 && git push origin HEAD:refs/meta/config \
 && cd / && rm -rf /tmp/spring-petclinic

COPY --chown=gerrit:gerrit ./db /var/gerrit/db

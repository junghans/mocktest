FROM registry.fedoraproject.org/fedora:rawhide

RUN dnf -y install fedpkg
RUN useradd -m -G mock -u 1001 user
WORKDIR /home/user

COPY mock/ /home/user/mock
RUN chown -R user:user /home/user/mock
USER mock
RUN cd mock && \
  cd mock-core-configs && \
  tito build --rpm && \
  cd ../mock && \
  tito build --rpm && \
  ls -R ../../

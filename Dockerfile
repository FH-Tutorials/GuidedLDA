FROM python:latest

RUN cd /root/ && git clone https://github.com/vi3k6i5/GuidedLDA.git
WORKDIR /root/GuidedLDA

RUN chmod a+x *.sh
RUN pip install cython numpy pbr

RUN make cython && \
    python setup.py clean && \
    python setup.py build_ext --inplace && \
    python setup.py sdist --formats=gztar 2>/dev/null || true && \
    pip install -e .
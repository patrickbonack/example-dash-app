FROM quay.bisinfo.org/bis/python-39:latest

ENV PIP_INDEX_URL="https://nexus.bisinfo.org:8443/repository/medit-pypi-group/simple"
ENV PIP_CERT="/opt/app-root/src/nexus.cer"
ENV PIP_EXTRA_INDEX_URL="https://nexus.bisinfo.org:8443/repository/bis-pypi-group/simple"



WORKDIR /app


COPY /code/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY /code .


EXPOSE 5000
CMD ["python", "app.py"]

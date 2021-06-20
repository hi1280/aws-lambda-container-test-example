# FROM python:3.8 as build
# RUN pip install pipenv
# WORKDIR /build
# COPY Pipfile Pipfile.lock /build/
# RUN PIPENV_VENV_IN_PROJECT=1 pipenv install
FROM public.ecr.aws/lambda/python:3.8
# COPY --from=build /build /app/
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["app.handler"]
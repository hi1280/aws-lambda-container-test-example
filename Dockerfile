FROM python:3.8 as build
RUN pip install pipenv
WORKDIR /build
COPY Pipfile Pipfile.lock /build/
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install

FROM public.ecr.aws/lambda/python:3.8
WORKDIR /app
COPY --from=build /build /app/
COPY . /app/
CMD ["app.handler"]
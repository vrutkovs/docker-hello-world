# -*- coding: utf-8 -*-
from common_steps.common_connection_steps import *
from common_steps.common_docker_steps import *


@step(u'Container output contains "{output}"')
def container_output_contains(context, output):
    assert context.job == output


@step(u'Docker container is started and exits with exit code "{expected_exit_code}"')
def container_started(context, expected_exit_code=0):
    # TODO: allow tables here
    context.job = context.run('docker run --cidfile %s %s' % (
        context.cid_file, context.image))
    context.cid = context.open_file(context.cid_file).read().strip()

    exit_code = context.run(
        "docker inspect --format='{{.State.ExitCode}}' %s" % context.cid).strip()
    assert exit_code == expected_exit_code, \
        "Expected %s but exit code was %s" % (expected_exit_code, exit_code)

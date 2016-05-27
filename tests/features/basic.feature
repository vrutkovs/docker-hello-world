Feature: Minimal test

  Scenario: Output is correct
    When Docker container is started and exits with exit code "0"
    Then Container output contains "I am rawhide/docker-hello-world-1.0-1"

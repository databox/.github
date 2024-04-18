'use strict';

// This script is used to build the docker build args from the string input
// The input string is a list of key-value pairs separated by new lines
// Example:
// AGR1:VALUE1
// ARG2:VALUE2

// The output is a string that can be used as an argument for the docker build command
const buildDockerBuildArgsFromString = (argsString) => {
  if (!argsString) {
    return '';
  }
  
  const args = argsString.split('\n');
  const result = args.map(arg => `--build-arg ${arg.replace(':', '=')}`).join(' ');
  return result;
}

export default buildDockerBuildArgsFromString;
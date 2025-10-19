#!/usr/bin/env node

const boxen = require('boxen');
const chalk = require('chalk');
const pkg = require('../package.json');
const { sleep } = require('./helper');

(async () => {
  console.log(
    `\n\n\n${boxen(
      `${chalk.hex('#00D9FF')(
        `🎉 Thank You for Installing FouadOSINT@${pkg.version}`,
      )} \n\n ${chalk.hex('#FFD93D')(
        '🔍 Advanced OSINT Framework',
      )} \n ${chalk.gray(
        `\n${chalk.hex('#6C63FF')('⚡ Quick Start:')} Type ${chalk.cyanBright(
          'fouadosint -h',
        )} for Help Menu \n\n${chalk.hex('#FF6B6B')('⭐ Don\'t forget to give this project a star!')} \n${chalk.gray('By Fouad Zalaf | zalaffouad37@gmail.com')}`,
      )}`,
      {
        padding: 1,
        borderColor: 'cyanBright',
        textAlignment: 'center',
        margin: 1,
        borderStyle: 'double',
      },
    )}\n\n\n`,
  );
  await sleep('2500');
})();

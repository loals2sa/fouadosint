const open = require('open');
const os = require('os');
const pkg = require('../package.json');

const body = `
### Describe the bug
A clear and concise description of what the bug is.

### Screenshots
If applicable, add screenshots to help explain your problem.

### System Information

**FouadOSINT Version** : ${pkg.version}
**Node Version** : ${process.version}
**OS Type** : ${os.type()}
**OS Version** : ${os.release()}
**OS Plateform** : ${os.platform()}
`;

// console.log(body);
const reportBug = () => {
  open(
    `https://github.com/fouadzalaf/fouadosint/issues/new?assignees=&labels=bug&title=&body=${encodeURIComponent(
      body,
    )}`,
  );
};

module.exports = reportBug;

var scriptsFolder = "/Users/ben/.mongodb/mongosh/scripts/";
var scripts = fs.readdirSync(scriptsFolder);
scripts.forEach((file) => {
  load(scriptsFolder + file)
});

(() => {
  _prompt = () => {
    try {
      db.getMongo();
    } catch {
      return ' →  ';
    }
    const dbName = db.getName();
    const serverBuildInfo = db.serverBuildInfo();
    const readPref = db.getMongo().getReadPrefMode();
    const atlas = /mongodb.net/.test(db.getMongo()._uri);
    const rpTagSet = db.getMongo().getReadPrefTagSet();
    const analyticsNode = rpTagSet ? rpTagSet.findIndex(({
      nodeType
    }) => nodeType === 'ANALYTICS') >= 0 : false;
    const localhost = /localhost|127\.0\.0\.1/.test(db.getMongo()._uri);

    let hasPrimary;
    try {
      hasPrimary = !!rs.status().members.find(({state}) => state === 1);
    } catch {
      // Fails when not started as replica set
      hasPrimary = true;
    }
    const leaf = '🍃';
    const laptop = '💻';
    const ship = '🛳';

    let serverInfo = '';
    if (serverBuildInfo.dataLake) {
      serverInfo += ship + ' ';
    } else if (serverBuildInfo.modules.includes('enterprise')) {
      serverInfo += `${atlas ? leaf : 'Enterprise'} `;
    } else if (localhost) {
      serverInfo += laptop + ' ';
    }

    return `${serverInfo}${hasPrimary ? '₁' : '₂'} 📖 ${readPref} ${analyticsNode ? '\uf080 ' : ''} 📚 ${dbName} → `;
  };

  boringPrompt = () => { prompt = undefined };
  prettyPrompt = () => { prompt = _prompt };
  prettyPrompt();
})();

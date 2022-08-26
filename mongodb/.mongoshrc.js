var scriptsFolder = "/Users/ben/.mongodb/mongosh/scripts/";
var scripts = fs.readdirSync(scriptsFolder);
scripts.forEach((file) => {
  load(scriptsFolder + file);
});

(() => {
  _prompt = () => {
    try {
      db.getMongo();
    } catch {
      return " →  ";
    }

    const dateOptions = {
      year: "numeric",
      month: "numeric",
      day: "numeric",
      hour: "numeric",
      minute: "numeric",
      second: "numeric",
      hour12: false,
    };
    const now = new Date();
    const nowFormat = new Intl.DateTimeFormat(Intl.DateTimeFormat().resolvedOptions().locale, dateOptions).format(now);

    const dbName = db.getName();
    const serverBuildInfo = db.serverBuildInfo();
    const readPref = db.getMongo().getReadPrefMode();
    const atlas = /mongodb.net/.test(db.getMongo()._uri);
    const localhost = /localhost|127\.0\.0\.1/.test(db.getMongo()._uri);

    let hasPrimary;
    try {
      hasPrimary = !!rs.status().members.find(({ state }) => state === 1);
    } catch {
      // Fails when not started as replica set
      hasPrimary = true;
    }
    const leaf = "🍃";
    const enterprise = "🏢";
    const laptop = "💻";
    const ship = "🛳";

    let serverInfo = "";
    if (serverBuildInfo.dataLake) {
      serverInfo += ship + " ";
    } else if (serverBuildInfo.modules.includes("enterprise")) {
      serverInfo += `${atlas ? leaf : enterprise} `;
    } else if (localhost) {
      serverInfo += laptop + " ";
    }

    return `${serverInfo}${hasPrimary ? "₁" : "₂"} - 📖 ${readPref} - 📚 ${dbName} - 🗓  ${nowFormat} → `;
  };

  boringPrompt = () => {
    prompt = undefined;
  };
  prettyPrompt = () => {
    prompt = _prompt;
  };
  prettyPrompt();
})();

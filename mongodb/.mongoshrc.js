{
  prompt = () => {
    return `${db.getName()} with ${db.stats().objects} documents> `
  }
}

#!/usr/bin/env node
const fs = require('fs');

try {
  const data = fs.readFileSync('./package.json', 'utf8');
  const pkg = JSON.parse(data);
  
  if (!pkg.version) {
    console.error('错误：无法提取版本号');
    process.exit(1);
  }

  const { execSync } = require('child_process');
  execSync(`git tag v${pkg.version}`);
  execSync(`git push origin v${pkg.version}`);
  
  console.log(`成功创建标签：v${pkg.version}`);
} catch (err) {
  console.error('错误：', err.message);
  process.exit(1);
}
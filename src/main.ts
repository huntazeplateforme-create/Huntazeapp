import { app, BrowserWindow, shell } from 'electron';
import path from 'path';

const DEFAULT_APP_URL = 'https://app.huntaze.com';

function getAppUrl(): string {
  const raw = (process.env.APP_URL || DEFAULT_APP_URL).trim();
  try {
    const url = new URL(raw);
    if (url.protocol !== 'https:' && url.protocol !== 'http:') return DEFAULT_APP_URL;
    return url.toString();
  } catch {
    return DEFAULT_APP_URL;
  }
}

function createWindow() {
  const win = new BrowserWindow({
    width: 1280,
    height: 800,
    backgroundColor: '#05060a',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false,
      sandbox: true,
    },
  });

  // Prevent remote content from spawning new BrowserWindows.
  // OAuth/payment flows generally use full-page redirects (allowed).
  win.webContents.setWindowOpenHandler(({ url }: { url: string }) => {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      void shell.openExternal(url);
    }
    return { action: 'deny' };
  });

  void win.loadURL(getAppUrl());
  return win;
}

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});


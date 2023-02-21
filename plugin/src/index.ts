import { Module, Args_currentTimestamp, manifest } from "./wrap";

import { PluginFactory, PluginPackage } from "@polywrap/plugin-js";

type NoConfig = Record<string, never>;

export class DateTimePlugin extends Module<NoConfig> {
  public currentTimestamp(_: Args_currentTimestamp): string {
    return Date.now().toString();
  }
}

export const dateTimePlugin: PluginFactory<NoConfig> = () => new PluginPackage(new DateTimePlugin({}), manifest)

export const plugin = dateTimePlugin;
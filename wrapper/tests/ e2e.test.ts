import { PolywrapClient, ClientConfigBuilder } from "@polywrap/client-js";
import { dateTimePlugin } from "../../plugin";
import path from "path"

jest.setTimeout(360000);

describe("e2e", () => {
  const config = new ClientConfigBuilder().addDefaults().addPackage("ens/datetime.polywrap.eth", dateTimePlugin()).build();
  const client: PolywrapClient = new PolywrapClient(config);

  const wrapperPath: string = path.join(path.resolve(__dirname), "..");
  const uri = `wrap://fs/${wrapperPath}/build`;

  it("gets current datetime", async () => {
    const result = await client.invoke<string>({
      uri,
      method: "currentTimestamp"
    });

    if (!result.ok) throw result.error;
    expect(result.value).toBeTruthy();
    expect(Number.parseInt(result.value)).toBeGreaterThanOrEqual(Date.now() - 300000);
    expect(Number.parseInt(result.value)).toBeLessThanOrEqual(Date.now());
  });
});

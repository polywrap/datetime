import { PolywrapClientConfigBuilder, PolywrapClient } from "@polywrap/client-js";
import { dateTimePlugin } from "../";

describe("e2e", () => {
  const uri = "wrapscan.io/polywrap/datetime@1.0";
  const config = new PolywrapClientConfigBuilder()
    .setPackage(uri, dateTimePlugin({})).build();
  const client: PolywrapClient = new PolywrapClient(config);

  it("retrieves current datetime", async () => {
    const result = await client.invoke({
      uri,
      method: "currentTimestamp"
    });

    if (!result.ok) throw result.error;
    expect(typeof result.value).toBe("string");
    expect(result.value).toMatch(/^\d+$/);
  });
});

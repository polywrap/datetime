import { ClientConfigBuilder, PolywrapClient } from "@polywrap/client-js";
import { dateTimePlugin } from "../";

describe("e2e", () => {
  const uri = "ens/datetime.polywrap.eth";
  const config = new ClientConfigBuilder().addPackage(uri, dateTimePlugin({})).build();
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
